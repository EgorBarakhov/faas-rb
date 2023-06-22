import { NavLink } from "react-router-dom";
import styled, { css } from "styled-components";

export const StyledLink = styled(NavLink)(
  ({ theme: { colors } }) => css`
    text-decoration: none;
    font-size: inherit;
    color: ${colors.gray68};

    &:hover {
      color: ${colors.primary};
      text-decoration: underline;
    }

    &.active {
      color: ${colors.primary};
    }
  `
);
