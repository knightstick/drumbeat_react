var Exercise = React.createClass({

  render: function() {
    return(
      <div className='exercise'>
        <ExerciseBody exercise={this.props.exercise} />
        <Scorecard exercise={this.props.exercise} />
      </div>
    );
  }
});


var ExerciseBody = React.createClass({

  render: function() {
    return(
      <div className='exercise-body'>
        <h1 className='exercise-header'>{this.props.exercise.name}</h1>
        <img src={this.props.exercise.image_url} alt={this.props.exercise.name} />
      </div>
    );
  }
});

var Scorecard = React.createClass({

  render: function() {
    return(
      <div className='scorecard'>
        <h1>Scorecard</h1>
        <ScoreWidget exercise={this.props.exercise} />
      </div>
    )
  }
});

var ScoreWidget = React.createClass({

  render: function() {
    return(
      <form>
        <input type="text" placeholder="120" />
        <input type="submit" value="Score!" />
      </form>
    );
  }
});