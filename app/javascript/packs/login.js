import React from "react";
import { render } from "react-dom";

import { parseDataNode } from "../components/shared/RenderUtils";
import Form from "../components/login/Form"

document.addEventListener("DOMContentLoaded", () => {
  const applicationData = parseDataNode("application_data");

  render(
    <Form loginPath={applicationData.login_path} />,
    document.querySelector("#login_form")
  );
});