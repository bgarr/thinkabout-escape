import { mount } from "svelte";
import GameShow from "../components/GameShow.svelte";

const gameShowElement = document.getElementById("game-show");
if (gameShowElement) {
  mount(GameShow, {
    target: gameShowElement,
  });
}
