import PropTypes from 'prop-types';
import TItem from './TItem';

function TList({ tasks, toggleComplete, deleteTask }) {
  return (
    <div className="task-list">
      {tasks.map((task, index) => (
        <TItem
          key={task.id ?? index}
          task={task}
          index={index}
          toggleComplete={toggleComplete}
          deleteTask={deleteTask}
        />
      ))}
    </div>
  );
}

// Prop types
TList.propTypes = {
  tasks: PropTypes.arrayOf(
    PropTypes.shape({
      text: PropTypes.string.isRequired,
      completed: PropTypes.bool.isRequired
    })
  ).isRequired,
  toggleComplete: PropTypes.func.isRequired,
  deleteTask: PropTypes.func.isRequired
};

export default TList;
