# linux-bootstrap
A collection of shell scripts and dotfiles to bootstrap a debian linux box

---

#### To run the bootstrap process:

via wget:

```shell
sh -c "$(wget https://raw.githubusercontent.com/codyhowarth/linux-bootstrap/master/bootstrap.sh -O -)"
```

via curl:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/codyhowarth/linux-bootstrap/master/bootstrap.sh)"
```
---

### TODO

- [ ] Pick up *all* atom configs (include things like no welcome screen, no telemtry)
- [ ] Pick up intellij/pycharm configs once they've been configured.
- [ ] Properly set up vim and pick up that config.
- [ ] Setup Unity (and other game dev tools)
- [ ] Refactor to remove duplicate code
