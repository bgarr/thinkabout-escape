<script lang="ts">
  import { Tipex, type TipexEditor } from "@friendofsvelte/tipex";
  import { Grammar, Parser } from "nearley";
  import { default as grammar } from "../puzzle_grammar";

  let editor: TipexEditor | undefined = $state();

  const body = "solution";
  const parser = new Parser(Grammar.fromCompiled(grammar));

  const parseContents = (_event: any) => {
    parser.feed(editor?.getText());
    console.log(parser.results);
  };
</script>

<Tipex
  {body}
  bind:tipex={editor}
  onupdate={parseContents}
  style="margin: 1rem; padding: 1rem; width: calc(100vw - 5rem); height: 46.5vh; background-color: #333; font-size: 12pt"
/>
