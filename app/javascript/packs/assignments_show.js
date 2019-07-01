import React from "react";
import { render } from "react-dom";
import Show from '../components/assignments/Show'
import { parseDataNode } from "../components/shared/RenderUtils";

document.addEventListener("DOMContentLoaded", () => {
  const assignmentShowData = parseDataNode("assignment_teacher_show_data");
  render(
    <Show {...assignmentShowData}/>,
    document.querySelector("#assignment_show")
  );
});