import PropTypes from 'prop-types';

function TaskItem({ task, index, toggleComplete, deleteTask }) {
  return (
    <div className="task-item">
      <span
        style={{
          textDecoration: task.completed ? 'line-through' : 'none',
          color: task.completed ? '#888' : '#000',
          cursor: 'pointer'
        }}
        onClick={() => toggleComplete(index)}
        role="button"
        aria-pressed={task.completed}
        tabIndex={0}
        onKeyDown={(e) => { if (e.key === 'Enter' || e.key === ' ') toggleComplete(index); }}
      >
        {task.text}
      </span>

      <div className="task-actions">
        <button type="button" onClick={() => toggleComplete(index)} aria-label="Mark task done">
          ✔
        </button>
        <button type="button" onClick={() => deleteTask(index)} aria-label="Delete task">
          ✘
        </button>
      </div>
    </div>
  );
}

// Prop types
TaskItem.propTypes = {
  task: PropTypes.shape({
    text: PropTypes.string.isRequired,
    completed: PropTypes.bool.isRequired
  }).isRequired,
  index: PropTypes.number.isRequired,
  toggleComplete: PropTypes.func.isRequired,
  deleteTask: PropTypes.func.isRequired
};

export default TaskItem;
