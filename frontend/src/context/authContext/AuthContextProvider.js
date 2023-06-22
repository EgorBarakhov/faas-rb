import { useWeb3React } from "@web3-react/core";
import { InjectedConnector } from "@web3-react/injected-connector";
import { useCallback, useEffect, useMemo, useState } from "react";
import {
  getParsedStorageData,
  setStorageData,
} from "services/localStorageService";

import AuthContext from "./AuthContext";

const AuthContextProvider = ({ children }) => {
  const { account, activate, deactivate } = useWeb3React();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const storageKey = "isWalletConnected";

  const injected = useMemo(
    () =>
      new InjectedConnector({
        supportedChainIds: [1, 1337, 11155111], // ETH Main, local Hardhat and Sepolia
      }),
    []
  );

  const isLoggedIn = useCallback(() => {
    return getParsedStorageData(storageKey);
  }, [storageKey]);

  const connect = useCallback(
    async (successCallback) => {
      setLoading(true);
      try {
        await activate(injected);

        if (!isLoggedIn()) setStorageData(storageKey, true);
        if (successCallback) successCallback();
      } catch (err) {
        setError(err);
      } finally {
        setLoading(false);
      }
    },
    [activate, injected, isLoggedIn, storageKey]
  );

  const disconnect = useCallback(
    (successCallback) => {
      try {
        deactivate();
        setStorageData(storageKey, false);
        if (successCallback) successCallback();
      } catch (err) {
        setError(err);
      }
    },
    [deactivate, storageKey]
  );

  useEffect(() => {
    if (!account && isLoggedIn()) {
      connect();
    }
  }, [connect, account, isLoggedIn]);

  const memoizedValue = useMemo(
    () => ({
      error,
      loading,
      isLoggedIn,
      disconnect,
      connect,
    }),
    [isLoggedIn, error, loading, disconnect, connect]
  );

  return (
    <AuthContext.Provider value={memoizedValue}>
      {children}
    </AuthContext.Provider>
  );
};

export default AuthContextProvider;
