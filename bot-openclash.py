import os
from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import Application, CommandHandler, CallbackContext, CallbackQueryHandler

# Replace with your Telegram bot token
TOKEN = "DOT_TOKEN"
ALLOWED_USERS = [TLEGRAM_ADMIN]  # Change to your actual Telegram ID

async def start(update: Update, context: CallbackContext):
    """Send the main menu with OpenClash status displayed."""
    user_id = update.message.chat_id if update.message else update.callback_query.message.chat_id

    if user_id not in ALLOWED_USERS:
        await update.message.reply_text("❌ Unauthorized access!")
        return

    status = check_openclash_status()

    menu_text = (
            "🔥 **QWRT BOT**\n"
            "━━━━━━\n"
        f"`{escape_markdown(status)}`\n"
    )

    keyboard = [
        [InlineKeyboardButton("🚀 Start OpenClash", callback_data="start"), InlineKeyboardButton("🛑 Stop OpenClash", callback_data="stop")],
        [InlineKeyboardButton("ℹ️ Check Status", callback_data="status")],
    ]

    reply_markup = InlineKeyboardMarkup(keyboard)

    if update.message:
        await update.message.reply_text(menu_text, parse_mode="MarkdownV2", reply_markup=reply_markup)
    else:
        await update.callback_query.edit_message_text(menu_text, parse_mode="MarkdownV2", reply_markup=reply_markup)

async def button_click(update: Update, context: CallbackContext):
    """Handle button clicks."""
    query = update.callback_query
    user_id = query.message.chat_id

    if user_id not in ALLOWED_USERS:
        await query.answer("❌ Unauthorized access!", show_alert=True)
        return

    action = query.data

    if action in ["start", "stop"]:
        os.system(f"/etc/init.d/openclash {action}")
        message_text = (
            "🔥 **QWRT BOT**\n"
            "━━━━━━\n"
            f"✅ OpenClash `{escape_markdown(action)}` command executed successfully!"
        )

    elif action == "status":
        message_text = (
            "🔥 **QWRT BOT**\n"
            "━━━━━━\n"
            f"`{escape_markdown(check_openclash_status())}`"
        )

    elif action == "menu":
        await start(update, context)
        return  # Stop further execution

    keyboard = [[InlineKeyboardButton("🔙 Back to Menu", callback_data="menu")]]
    reply_markup = InlineKeyboardMarkup(keyboard)

    await query.edit_message_text(message_text, parse_mode="MarkdownV2", reply_markup=reply_markup)

def check_openclash_status():
    """Check if OpenClash is running."""
    process_check = os.popen("pgrep -f clash").read().strip()
    if process_check:
        return "✅ OpenClash is running!"
    return "🛑 OpenClash is NOT running!"

def escape_markdown(text):
    """Escape special characters for MarkdownV2 formatting."""
    escape_chars = "_*[]()~`>#+-=|{}.!\\"
    return "".join(f"\\{char}" if char in escape_chars else char for char in text)

def main():
    app = Application.builder().token(TOKEN).build()

    app.add_handler(CommandHandler("start", start))
    app.add_handler(CallbackQueryHandler(button_click))

    print("🚀 Bot is running...")
    app.run_polling()

if __name__ == "__main__":
    main()
