import React from "react";
import { render } from "react-dom";
import Index from '../components/gists/Index'
import { parseDataNode } from "../components/shared/RenderUtils";

document.addEventListener("DOMContentLoaded", () => {
  const clientCredentialsData = parseDataNode("assignments_show_data");
  const applicationData = parseDataNode("application_data")

  render(
    <Index {...clientCredentialsData} userId={applicationData.user_id}/>,
    document.querySelector("#gist_list")
  );
});