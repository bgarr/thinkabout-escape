import { mount } from "svelte";
import PuzzleEdit from "../components/PuzzleEditor.svelte";

const puzzleEditElement = document.getElementById("puzzle-edit");
if (puzzleEditElement) {
  mount(PuzzleEdit, {
    target: puzzleEditElement,
  });
}
