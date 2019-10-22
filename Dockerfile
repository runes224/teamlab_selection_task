#ベースイメージの指定
FROM ruby:2.6.5-alpine3.10

# 環境変数の指定
ENV LANG C.UTF-8

# パッケージのアップグレード＆追加
RUN apk upgrade && \
    apk add --no-cache \
    bash \
    build-base \
    curl-dev \
    git \
    graphviz \
    imagemagick \
    imagemagick-dev \
    less \
    libxml2-dev \
    libxslt-dev \
    mysql-client \
    mysql-dev \
    nodejs \
    openssl \
    readline \
    readline-dev \
    tar \
    ttf-freefont \
    tzdata \
    udev \
    wget \
    yaml \
    yaml-dev\
    zlib \
    zlib-dev

# bundlerのインストール
RUN gem install bundler

# インストール済み全gemを更新
RUN gem update

# アプリケーションのディレクトリを定義する
ENV APP_HOME /teamlab_selection_task

# アプリケーションのルートディレクトリを作成する
RUN mkdir $APP_HOME

# ワークディレクトリを設定する
WORKDIR $APP_HOME

# Gem のホームディレクトリを定義する
ENV GEM_HOME=/bundle

# アプリケーションのディレクトリにGemfileを追加
ADD Gemfile* $APP_HOME/

# Bundlerで使用するGemfileの定義
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    # Bundlerの並列実行可能な数を定義する
    BUNDLE_JOBS=4 \
    # bundlerのパスを指定する
    BUNDLE_PATH=$GEM_HOME

# アプリケーションをルートディレクトリに追加する
ADD . $APP_HOME