# Development

## Part 3

Use `scripts/launch-chat-with-invite.sh` to open PearChat with an invite. You might find this script useful to launch a distributable on a second machine with an invite code from the first machine. This currently seems to be a missing piece after Step 3 and before [Step 4](https://docs.pears.com/getting-started/build-a-peer-to-peer-chat/ship/#build-the-deployment-directory) in Part 3 of Getting Started docs.

```sh
./scripts/launch-chat-with-invite.sh --invite <invite>
```

Optional flags:

```sh
--app /path/to/PearChat.app
--name user2
--storage /tmp/pear-chat-user2
--reset
```

If join fails, use a fresh --storage path or add --reset.

## Part 2 Documentation (part 2 of the getting started path)

Step-by-step walkthrough: [Reshape into a production app](https://docs.pears.com/getting-started/build-a-peer-to-peer-chat/reshape-into-a-production-app).

This is the **shared scaffold** that chat-family and media how-to examples extend. Read it before adapting any delta under `examples/how-to/`.

> **Note:** This example embeds `pear-runtime` as a library, following the [hello-pear-electron](https://github.com/holepunchto/hello-pear-electron) template.

## Usage

```shell
npm i
npm run build

# user1: create the room + print an invite
npm start -- --storage /tmp/pear-chat-user1 --name user1

# user2: join (separate terminal)
npm start -- --storage /tmp/pear-chat-user2 --name user2 --invite <invite>
```

## Build installers

```shell
npm i
npm run build
npm run make
```

## Troubleshoot

```shell
npm start -- --storage /tmp/pear-chat-user1 --name user1 --reset
```
