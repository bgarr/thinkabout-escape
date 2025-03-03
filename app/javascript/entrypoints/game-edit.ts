import { mount } from "svelte";
import GameEdit from "../components/GameEdit.svelte";

const gameEditElement = document.getElementById("game-edit");
if (gameEditElement) {
  mount(GameEdit, {
    target: gameEditElement,
  });
}
