import React, { useState } from 'react';
import PropTypes from 'prop-types';

function TInput({ addTask }) {
  const [task, setTask] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    if (task.trim()) {
      addTask(task);
      setTask('');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        value={task}
        onChange={(e) => setTask(e.target.value)}
        placeholder="Enter new task"
      />
      <button type="submit">↪</button>
    </form>
  );
}

TInput.propTypes = {
  addTask: PropTypes.func.isRequired
};

export default TInput;
