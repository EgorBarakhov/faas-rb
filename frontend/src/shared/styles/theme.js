export const colors = {
  black: "#000",
  white: "#fff",
  white30: "#ffffff30",
  white50: "#ffffff50",
  primary: "#6610f2",
  primaryDark: "#4f0cbc",
  purple: "#6610f2",
  purpleDark: "#4f0cbc",
  grayF8: "#f8f9fa",
  gray68: "#68717a",
  grayAD: "#adadad",
  grayF4: "#f4f4f4",
  yellow: "#eafe51",
  yellowDark: "#e1f738",
};

export const breakpoints = {
  xs: 320,
  sm: 576,
  md: 768,
  lg: 992,
  xl: 1200,
};

// Try to use existing z-index values instead of creating new ones
export const zIndex = {
  max: 4, // background loaders, notifications
  aboveContent: 3, // modals, popups, menu panels
  contentMax: 2,
  contentMin: 1,
  default: 0,
  hiddenContent: -1,
};

export const borderRadius = "0.375rem";

export const layoutYPadding = "1.9rem";

export const fonts = {
  secondary: '"Irish Grover", cursive',
};

export const up = (breakpoint, vertical = false) =>
  `@media (min-${vertical ? "height" : "width"}: ${breakpoint + 0.02}px)`;

export const down = (breakpoint, vertical = false) =>
  `@media (max-${vertical ? "height" : "width"}: ${breakpoint}px)`;

export const between = (breakpointMin, breakpointMax, vertical = false) =>
  `@media (max-${vertical ? "height" : "width"}: ${breakpointMax}px) and (min-${
    vertical ? "height" : "width"
  }: ${breakpointMin + 0.02}px)`;

const theme = {
  colors,
  breakpoints,
  borderRadius,
  layoutYPadding,
  zIndex,
  fonts,
  up,
  down,
  between,
};

export default theme;
