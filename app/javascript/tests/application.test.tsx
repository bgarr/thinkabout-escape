import React from "react"
import { render, screen } from '@testing-library/react'
import '@testing-library/jest-dom'
import { App } from "../src/entrypoints/application"

describe("Application", () => {
  it("renders", () => {
    render(<App />)
    expect(screen.getByRole("heading")).toHaveTextContent("Hello from React!")
  })
})