# Notes to self

These are notes-to-self as a I get to know the multi-step process on <https://docs.pears.com/getting-started/build-a-peer-to-peer-chat/ship/#build-the-deployment-directory>.

## The Notes

output of `pear touch` the first time is the <stage-link>:
pear://htrzdet8b97gzfosz9c178pj5jy6m9x1w3e4x5sfuntxte48afyo

the dry-run command:
`pear stage --dry-run pear://htrzdet8b97gzfosz9c178pj5jy6m9x1w3e4x5sfuntxte48afyo ./pear-chat-1.0.1`

output of non-dry-run command `pear stage pear://htrzdet8b97gzfosz9c178pj5jy6m9x1w3e4x5sfuntxte48afyo ./pear-chat-1.0.1`:
pear://0.3034.htrzdet8b97gzfosz9c178pj5jy6m9x1w3e4x5sfuntxte48afyo

output of `pear touch` again is the <provision-link>;
pear://jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy

the next dry-run command is
pear provision --dry-run pear://0.<length>.<stage-key> pear://<provision-link> pear://0.0.<provision-key>
`pear provision --dry-run pear://0.3034.htrzdet8b97gzfosz9c178pj5jy6m9x1w3e4x5sfuntxte48afyo pear://jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy pear://0.0.jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy`

and without dry-run
pear provision pear://0.<length>.<stage-key> pear://jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy pear://0.0.<provision-key>
`pear provision pear://0.3034.htrzdet8b97gzfosz9c178pj5jy6m9x1w3e4x5sfuntxte48afyo pear://jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy pear://0.0.jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy`

the output was long, here is partial:

```text
pear provision pear://0.3034.htrzdet8b97gzfosz9c178pj5jy6m9x1w3e4x5sfuntxte48afyo pear://jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy pear://0.0.jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy
Syncing existing metadata, please wait...

Completed metadata sync
Checking diff

+ /by-arch/darwin-arm64/app/PearChat.app/Contents/Frameworks/Electron Framework.framework/Electron Framework (0B)
+ /by-arch/darwin-arm64/app/PearChat.app/Contents/Frameworks/Electron Framework.framework/Helpers (0B)
...
+ /by-arch/darwin-x64/app/PearChat.app/Contents/Resources/electron.icns (+13.7kB)
+ /package.json (+2.1kB)
Diffing complete
Total changes: 3033
Package version: 1.0.1

Core:
  Key: jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy
  Length: 0
  Hash: zcakemy6cmak9s19bj8ewitxxej4ru8kydzedrm5o4hj7yyun1iy

Blobs:
  Key: q6sfkujeie8ek637956zk7w5555w95h5sijd6ck9f4pocmobmpco
  Length: 0
  Hash: zcakemy6cmak9s19bj8ewitxxej4ru8kydzedrm5o4hj7yyun1iy

NOT A DRY RUN! Waiting 10s for certainty. Use ctrl+c to bail
Staging to target...
+ /by-arch/darwin-arm64/app/PearChat.app/Contents/Frameworks/Electron Framework.framework/Electron Framework (0B)
+ /by-arch/darwin-arm64/app/PearChat.app/Contents/Frameworks/Electron Framework.framework/Helpers (0B)
...
+ /by-arch/darwin-x64/app/PearChat.app/Contents/Resources/electron.icns (+13.7kB)
+ /package.json (+2.1kB)


Provisioned:
  Verlink: pear://0.3034.jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy

  Hashlink: pear://0.3034.jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy.dxbccgqdcxh4phmktho9bouzni3sy93ejomau6mi13uwd6crd5ty

Seed with:

   pear seed pear://jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy
```

Then

```zsh
cd pear-chat
npm pkg set upgrade=pear://jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy
pear seed pear://jbeqxnkr7z4tqd53witmb9h8tzcdftp5apyi358oaywkz3yhgpcy
```