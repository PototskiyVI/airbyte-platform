import { createJsonDestinationViaApi } from "@cy/commands/connection";
import { createLocalJsonDestination, deleteDestination, updateDestination } from "commands/destination";

describe("Destination main actions", () => {
  it("Should redirect from destination list page to create destination page if no sources are configured", () => {
    cy.intercept("POST", "/api/v1/destinations/list", {
      statusCode: 200,
      body: {
        destinations: [],
      },
    });

    cy.visit("/destination");

    cy.url().should("match", /.*\/destination\/new-destination/);
  });
  it("Create new destination", () => {
    createLocalJsonDestination("Test destination cypress", "/local");

    cy.url().should("include", `/destination/`);
  });

  it("Update destination", () => {
    createJsonDestinationViaApi().then((jsonDestination) => {
      updateDestination(jsonDestination.name, "connectionConfiguration.destination_path", "/local/my-json");

      cy.get("div[data-id='success-result']").should("exist");
      cy.get("input[value='/local/my-json']").should("exist");
    });
  });

  it("Delete destination", () => {
    createJsonDestinationViaApi().then((jsonDestination) => {
      deleteDestination(jsonDestination.name);

      cy.visit("/destination");
      cy.get("div").contains(jsonDestination.name).should("not.exist");
    });
  });
});
