import { Navigate, Outlet } from "react-router-dom";

import Header from "components/Header";
import { useAuthContext } from "context/authContext";

import { Wrapper, Main } from "./styled";

const DefaultLayout = () => {
  const { isLoggedIn } = useAuthContext();

  if (!isLoggedIn()) {
    return <Navigate to="/login" />;
  }

  return (
    <Wrapper>
      <Header />

      <Main>
        <Outlet />
      </Main>
    </Wrapper>
  );
};

export default DefaultLayout;
