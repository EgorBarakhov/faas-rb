import styled, { css } from "styled-components";

export const Wrapper = styled.div`
  display: flex;
  flex-direction: column;
  min-height: 100vh;
`;

export const Main = styled.main(
  ({ theme: { down, breakpoints } }) => css`
    position: relative;
    flex-grow: 1;
    width: 100%;
    min-height: 100%;
    padding: 1.9rem;

    ${down(breakpoints.sm)} {
      padding: 1.9rem 0.9rem;
    }
  `
);
