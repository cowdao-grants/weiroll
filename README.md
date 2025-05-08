# Weiroll

Weiroll is a flexible execution system designed to enable trust-minimized and gas-efficient scripting on Ethereum. This repository builds upon the original concept of weiroll with a simple self-contained deployment.

## Acknowledgements

This repository owes its origins to the pioneering work done by the original [weiroll](https://github.com/weiroll/weiroll) project.

In addition, we also acknowledge the innovative team behind [Enso Finance's fork of weiroll](https://github.com/enso-finance/enso-weiroll).

## Documentation

Detailed documentation on the Weiroll project can be found in the aforementioned repositories.

## Development

### 0. Pre-requisites

Even though the deterministic deployment is used, on the latest foundry versions, different addresses are generated.
It is required to use the following foundry toolchain version:

```shell
foundryup -C cb9dfae298fe0b5a5cdef2536955f50b8c7f0bf5
```

### 1. Build

```shell
forge build
```

### 2. Test

```shell
forge test
```

### 3. Format

```shell
forge fmt
```

### 4. Export the required environment variables

```shell
export ETHERSCAN_API_KEY='your API key here' # required only for etherscan based explorers
export PK='the private key of the deployer'
export ETH_RPC_URL='https://rpc.node.url.here.example.com'
````

### 5. Verify deterministic address

```shell
forge script 'script/DeployableVM.s.sol:DeployableVMScript' -vvvv --rpc-url "$ETH_RPC_URL" --private-key "$PK"
```

### 6. Deploy

All contracts in this repo can be deployed and verified on the block explorer as follows:

```shell
forge script 'script/DeployableVM.s.sol:DeployableVMScript' -vvvv --rpc-url "$ETH_RPC_URL" --private-key "$PK" --verify --broadcast
```

### 7. Commit the deployment file

After successfully deploying the contracts, a deployment file is automatically generated in the [./broadcast/DeployableVM.s.sol](broadcast/DeployableVM.s.sol) directory under the relevant chain subdirectory. Make sure to commit this file to the repository.

### 8. Deployment addresses

The file [`networks.json`](./networks.json) lists all official deployments of the contracts in this repository by chain id.

The deployment address file is generated with:
```shell
bash dev/generate-networks-file.sh > networks.json
```
