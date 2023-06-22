import styled, { css } from "styled-components";

export const DropdownItem = styled.div(
  ({ theme: { colors } }) => css`
    display: flex;
    align-items: center;
    width: 100%;
    padding: 0.63rem;
    font-size: 0.9rem;

    &:last-child {
      background-color: ${colors.grayF8};
    }
  `
);
