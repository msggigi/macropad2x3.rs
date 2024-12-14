# embedded-rs-template

Rust template for embedded development

## Target setup steps from start

Template is for Raspi Pico. In the following chapters some other possibilities are documented

### Raspberry Pi Pico 

```
rustup target add thumbv6m-none-eabi  // It is a Cortex-M0+ dual core
cargo add cortex-m-rt
cargo add panic_halt
rustup component add llvm-tools
cargo install cargo-binutils
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/probe-rs/probe-rs/releases/latest/download/probe-rs-tools-installer.sh | sh

```

### Microbit

Replace first step
```
rustup target add thumbv7em-none-eabihf  // It is a Cortex-M4F
```

### In General

```
touch memory.x  // Fill in the memory layout in the generated file
```

#### VS Code settings

``` 
mkdir .vscode
touch .vscode/settings.json
```

```
{
    "rust-analyzer.check.allTargets": false,
    "rust-analyzer.cargo.target": "thumbv6m-none-eabi"
}
```

#### Cargo settings

```
mkdir .cargo
touch .cargo/config.toml
```

```
[target.thumbv6m-none-eabi]
rustflags = [
    "-C", "link-arg=-Tlink.x",
]

[build]
target = "thumbv6m-none-eabi"
```

#### Cargo-embed settings

``` 
touch Embed.toml
```

```
[default.general]
chip = "Cortex-M0+"
```

## Sensors

### Temperature

#### DHT11 and DHT22 with Pico PIO peripheral
```
cargo add dht-pio
```

#### BME280

TODO

# Credits
Most of this template is inspired by [@The Rust Bits](https://www.youtube.com/@therustybits) Youtube Video [Embedded Rust setup explained](https://www.youtube.com/watch?v=TOAynddiu5M)
