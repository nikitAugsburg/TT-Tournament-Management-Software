use rusqlite::{Connection, Result};
use tauri::Manager;

#[tauri::command]
fn init_db() -> Result<String, String> {
    let conn = Connection::open("tournament.db").map_err(|e| e.to_string())?;
    conn.execute(
        "CREATE TABLE IF NOT EXISTS players (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL
        )",
        [],
    ).map_err(|e| e.to_string())?;
    Ok("Database initialized and players table created (if not exists).".to_string())
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
  tauri::Builder::default()
    .setup(|app| {
      if cfg!(debug_assertions) {
        app.handle().plugin(
          tauri_plugin_log::Builder::default()
            .level(log::LevelFilter::Info)
            .build(),
        )?;
      }
      Ok(())
    })
    .invoke_handler(tauri::generate_handler![init_db])
    .run(tauri::generate_context!())
    .expect("error while running tauri application");
}
