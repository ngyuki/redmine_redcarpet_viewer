# Redmine Redcarpet Repository Viewer plugin

Redmine のリポジトリビュワーで Markdown ファイルを表示したときに、Redcarpet で解析して表示するプラグインです。

## インストール

Redmine のプラグインディレクトリに移動します。

```console
$ cd /path/to/redmine/plugins/
```

プラグインを clone します。

```console
$ git clone https://github.com/ngyuki/redmine_redcarpet_viewer.git
```

Bundler で必要なパッケージをインストールします。

```console
$ cd /path/to/redmine/
$ bundle install
```

Redmine を再起動します。

```console
$ sudo service httpd restart
```
