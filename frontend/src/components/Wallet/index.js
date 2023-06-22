import { useWeb3React } from "@web3-react/core";
import { useNavigate } from "react-router-dom";
import truncateEthAddress from "truncate-eth-address";

import { useAuthContext } from "context/authContext";
import { TextButton } from "shared/ui/buttons";
import Dropdown from "shared/ui/Dropdown";

import { DropdownItem } from "./styled";

const Wallet = () => {
  const { active, account } = useWeb3React();
  const { disconnect } = useAuthContext();
  const navigate = useNavigate();

  const disconnectWallet = () => {
    disconnect(() => navigate("/login"));
  };

  if (!active) return null;

  return (
    <Dropdown withArrow isActionLink actionText="Account">
      <DropdownItem>
        <strong>{truncateEthAddress(account)}</strong>
      </DropdownItem>

      <DropdownItem>
        <TextButton
          additionalClasses="text-danger"
          isUnderline
          onClick={disconnectWallet}
        >
          Disconnect
        </TextButton>
      </DropdownItem>
    </Dropdown>
  );
};

export default Wallet;
