var Exercise = React.createClass({

  render: function() {
    return(
      <div className='exercise'>
        <ExerciseBody exercise={this.props.exercise} />
        <Scorecard exercise={this.props.exercise} url={this.props.url} />
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


// TODO: try and use data more...
var Scorecard = React.createClass({
  handleScoreSubmit: function(score) {
    this.setState({data: score}, function() {
      // `setState` accepts a callback. To avoid (improbable) race condition,
      // `we'll send the ajax request right after we optimistically set the new
      // `state.
      $.ajax({
        url: this.props.url,
        dataType: 'json',
        type: 'POST',
        data:
          {
            score: {
              discipline: '4_bars',
              score: this.state.data.score
            }
          },
        success: function(data) {
          this.setState({data: data});
        }.bind(this),
        error: function(xhr, status, err) {
          debugger
        }.bind(this)
      });
    });
  },

  render: function() {
    return(
      <ScoreWidget onScoreSubmit={this.handleScoreSubmit}/>
    )
  }
});

var ScoreWidget = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    var score = React.findDOMNode(this.refs.score).value.trim();
    if (!score) {
      return
    }
    // Should discipline be state?
    this.props.onScoreSubmit({score: score, discipline: '4_bars'})
    React.findDOMNode(this.refs.score).value = '';
    React.findDOMNode(this.refs.score).placeholder = score;
  },

  // TODO: Set placholder equal to score, Make input look nice
  render: function() {
    return(
      <div className='panel'>
        <form className="scoreForm" onSubmit={this.handleSubmit}>
          <div className="input-group">
            <input type="text" className="form-control" placeholder="120" ref="score" />
            <input type="submit" value="Score" name="Score" />
          </div>
        </form>
      </div>
    );
  }
});
