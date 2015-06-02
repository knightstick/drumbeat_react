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
        <div className='well exercise-description'>
          <p>{this.props.exercise.description}</p>
        </div>
      </div>
    );
  }
});

var Scorecard = React.createClass({

  render: function() {
    return(
      <ScoreWidget exercise={this.props.exercise} />
    )
  }
});

var ScoreWidget = React.createClass({

  render: function() {
    return(
      <div className='panel'>
        <form>
          <div className="input-group">
            <input type="text" className="form-control" placeholder="120" />
            <span className="input-group-btn">
              <button className="btn btn-default btn-danger" type="button">Score!</button>
            </span>
          </div>
        </form>
      </div>
    );
  }
});
