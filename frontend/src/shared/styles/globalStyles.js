import { createGlobalStyle } from "styled-components";
import { H1, H2, H3 } from "./headersStyles";

const GlobalStyle = createGlobalStyle`
  body {
    margin: 0;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  code {
    font-family: source-code-pro, Menlo, Monaco, Consolas, "Courier New",
      monospace;
  }

  a,
  button {
    cursor: pointer;
  }

  ul,
  ol {
    list-style: none;
    margin: 0;
    padding: 0;
  }

  h1 {
    ${H1}
  }

  h2 {
    ${H2}
  }

  h3 {
    ${H3}
  }
`;

export default GlobalStyle;
