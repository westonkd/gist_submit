import React from "react";
import { render } from "react-dom";

import { parseDataNode } from "../components/shared/RenderUtils";
import CreateForm from "../components/platforms/CreateForm"

document.addEventListener("DOMContentLoaded", () => {
  const platformsData = parseDataNode("platforms_data");

  render(
    <CreateForm formAction={platformsData.formAction} credentialUrl={platformsData.credentialUrl} />,
    document.querySelector("#new_form")
  );
});