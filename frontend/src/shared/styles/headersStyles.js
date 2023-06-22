import { css } from "styled-components";

const commonStyles = () => css`
  margin: 0 0 0.9rem;
  font-weight: bold;
`;

export const H1 = () =>
  css`
    ${commonStyles()}
    font-size: 2rem;
  `;

export const H2 = () =>
  css`
    ${commonStyles()}
    font-size: 1.5rem;
  `;

export const H3 = () =>
  css`
    ${commonStyles()}
    font-size: 1.25rem;
  `;
