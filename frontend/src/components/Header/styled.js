import { NavLink } from "react-router-dom";
import styled, { css } from "styled-components";

export const StyledHeader = styled.header(
  ({ theme: { colors } }) => css`
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0.9rem;
    gap: 0.9rem;
    color: ${colors.gray68};
  `
);

export const LogoLink = styled(NavLink)(
  ({ theme: { colors } }) => css`
    color: ${colors.gray68};
    font-size: 1.25rem;
    font-weight: bold;
    text-decoration: none;

    &.active {
      color: ${colors.gray68};
    }

    &:hover {
      color: ${colors.primary};
    }
  `
);

export const NavigationSection = styled.div(
  ({ theme: { colors, down, breakpoints } }) => css`
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1.6rem;
    color: ${colors.gray68};
    font-size: 1rem;

    ${down(breakpoints.sm)} {
      font-size: 0.87rem;
    }
  `
);
