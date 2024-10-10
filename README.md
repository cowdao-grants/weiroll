# Weiroll

Weiroll is a flexible execution system designed to enable trust-minimized and gas-efficient scripting on Ethereum. This repository builds upon the original concept of weiroll with a simple self-contained deployment.

## Acknowledgements

This repository owes its origins to the pioneering work done by the original [weiroll](https://github.com/weiroll/weiroll) project.

In addition, we also acknowledge the innovative team behind [Enso Finance's fork of weiroll](https://github.com/enso-finance/enso-weiroll).

## Documentation

Detailed documentation on the Weiroll project can be found in the aforementioned repositories.

## Development

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Deploy

All contracts in this repo can be deployed and verified on the block explorer as follows:

```sh
export ETHERSCAN_API_KEY='your API key here'
PK='the private key of the deployer'
ETH_RPC_URL='https://rpc.node.url.here.example.com'
forge script 'script/DeployableVM.s.sol:DeployableVMScript' -vvvv --rpc-url "$ETH_RPC_URL" --private-key "$PK" --verify --broadcast
```

### Deployment addresses

The file [`networks.json`](./networks.json) lists all official deployments of the contracts in this repository by chain id.

The deployment address file is generated with:
```sh
bash dev/generate-networks-file.sh > networks.json
```
