# Development

##

Use `launch-chat-with-invite.sh` to open PearChat with an invite. You might find this script useful to launch a distributable on a second machine with an invite code from the first machine. This currently seems to be a missing piece after Step 3 and before [Step 4](https://docs.pears.com/getting-started/build-a-peer-to-peer-chat/ship/#build-the-deployment-directory) in Part 3 of Getting Started docs.

```sh
./launch-chat-with-invite.sh --invite <invite>
```

Optional flags:

```sh
--app /path/to/PearChat.app
--name user2
--storage /tmp/pear-chat-user2
--reset
```

If join fails, use a fresh --storage path or add --reset.
