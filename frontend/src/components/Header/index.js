import Wallet from "components/Wallet";
import Navigation from "./Navigation";
import { StyledHeader, LogoLink, NavigationSection } from "./styled";

const Header = () => {
  return (
    <StyledHeader className="bg-light">
      <LogoLink to="/admin">Abracadabra</LogoLink>

      <NavigationSection>
        <Navigation />
        <Wallet />
      </NavigationSection>
    </StyledHeader>
  );
};

export default Header;
