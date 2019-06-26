import React from "react";
import { render } from "react-dom";
import Index from '../components/assignments/Index'
import { parseDataNode } from "../components/shared/RenderUtils";

document.addEventListener("DOMContentLoaded", () => {
  const clientCredentialsData = parseDataNode("assignments_index_data");
  render(
    <Index {...clientCredentialsData}/>,
    document.querySelector("#assignment_index")
  );
});