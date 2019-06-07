import React from "react";
import { render } from "react-dom";

import { parseDataNode } from "../components/shared/RenderUtils";
import CreateForm from "../components/credentials/CreateForm"

document.addEventListener("DOMContentLoaded", () => {
  const clientCredentialsData = parseDataNode("client_credentials_data");
  render(
    <CreateForm {...clientCredentialsData}/>,
    document.querySelector("#new_form")
  );
});