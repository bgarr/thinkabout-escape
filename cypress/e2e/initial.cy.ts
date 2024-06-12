import { cy } from "local-cypress"

describe('start the app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('responds to user actions', () => {
    // We use the `cy.get()` command to get all elements that match the selector.
    // Then, we use `should` to assert that there are two matched items,
    // which are the two default items.
    const checkbox = cy.get('#the-check-box')
    checkbox.check()
    checkbox.should("be.checked");
  })
})