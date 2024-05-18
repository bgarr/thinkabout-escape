import React from "react";
import ReactDOM from "react-dom/client";

export const App = () => <h1>Hello from React!</h1>;

document.addEventListener('DOMContentLoaded', () => {
  const root = ReactDOM.createRoot(
    document.getElementById("root") as HTMLElement
  );

  root.render(<App />);
}, false);