import { ethers } from "ethers";
import { Web3ReactProvider } from "@web3-react/core";
import { ThemeProvider } from "styled-components";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";

import { GlobalStyles, theme } from "shared/styles";
import { AuthContextProvider } from "context/authContext";
import routes from "routes";

const router = createBrowserRouter(routes);

function App() {
  const getLibrary = (provider) => new ethers.providers.Web3Provider(provider);

  return (
    <Web3ReactProvider getLibrary={getLibrary}>
      <ThemeProvider theme={theme}>
        <GlobalStyles />

        <AuthContextProvider>
          <RouterProvider router={router} />
        </AuthContextProvider>
      </ThemeProvider>
    </Web3ReactProvider>
  );
}

export default App;
