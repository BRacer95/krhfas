import React, { useState } from 'react';
import './App.css';
import TaskInput from './TInput';
import TaskList from './TList';
import Container from './Container';

function App() {
  const [tasks, setTasks] = useState([]);

  const addTask = (task) => {
    setTasks([...tasks, { text: task, completed: false }]);
  };

  const toggleComplete = (index) => {
    const newTasks = [...tasks];
    newTasks[index].completed = !newTasks[index].completed;
    setTasks(newTasks);
  };

  const deleteTask = (index) => {
    const newTasks = tasks.filter((_, i) => i !== index);
    setTasks(newTasks);
  };

  return (
    <div className="container">
      <header>
        <div>
          <div>
            <img src="assignment.png" alt="logo" />
          </div>
          <h1>Todo List</h1>
          <p className="small">Manage your tasks simply and quickly</p>
        </div>
      </header>

      <Container>
        <TaskInput addTask={addTask} />
        <TaskList tasks={tasks} toggleComplete={toggleComplete} deleteTask={deleteTask} />
      </Container>
    </div>
  );
}

export default App;
