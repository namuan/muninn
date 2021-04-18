"""Bot wrapper"""
import os

import click
from telegram import Update


from telegram.ext import Updater, CommandHandler, MessageHandler, Filters


def welcome(update: Update, _) -> None:
    """Handle start command"""
    if update.message:
        update.message.reply_text("Hi!")


def help_command(update: Update, _) -> None:
    """Handle help command"""
    if update.message:
        update.message.reply_text("Help!")


def handle_cmd(update: Update, _) -> None:
    """Handle all updates"""
    if update.message:
        click.echo(update.message.text)


def start_bot() -> bool:
    """Start bot and hook callback functions"""
    print("🏗 Starting bot")
    bot_token = os.getenv("TELE_MUNINN_BOT_TOKEN")
    updater = Updater(bot_token, use_context=True)
    dispatcher = updater.dispatcher

    dispatcher.add_handler(CommandHandler("start", welcome))
    dispatcher.add_handler(CommandHandler("help", help_command))
    dispatcher.add_handler(MessageHandler(Filters.text & ~Filters.command, handle_cmd))

    updater.start_polling()
    updater.idle()
    return True
