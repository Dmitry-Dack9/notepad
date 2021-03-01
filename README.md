# Notepad (Блокнот)
Small terminal application for different notes (could be chosen from Memo, Todo or Link).

## Screenshot
![Application screenshot](https://github.com/dmentry/notepad/blob/master/notepad.jpg)

## Main requirements
* Ruby

* SQLite

* gem sqlite3

## Run
### Add new note

```
ruby new_post.rb
```

### Read recorded notes

```
ruby read.rb [options]
```

### Help

```
ruby read.rb -h
```

## Notes storage
All the notes are recorded in `notepad.sqlite` in the root directory of the application.
