
const styles = {

  active: {
    display: "inherit"
  },
  inactive: {
    display: "none"
  }
};

var Describe = React.createClass({

  getInitialState: function() {
      return {
        active: false,
        className: ""
      };
    },



  handleEnter: function () {
    this.setState({
      className: "qush-button"
    });
  },

  handleClick: function () {
    this.setState({
      active: !this.state.active,
    });

    $('#describeCollapsible').collapse('toggle')
  },

  render: function() {
    const stateStyle = this.state.active? styles.active : styles.inactive;
    return (
      <div>
        <button onMouseEnter={this.handleEnter} onClick={this.handleClick} className="qush-button">
          Describe
        </button>



      </div>



    );
  }
});




// Describe.propTypes = {
//
// }
