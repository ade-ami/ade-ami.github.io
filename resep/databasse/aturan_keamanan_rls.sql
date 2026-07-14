-- ==============================================================================
-- SCRIPT KEAMANAN DATABASE: MENGAKTIFKAN RLS & POLICIES SUPABASE
-- ==============================================================================

-- STREAMING_CHUNK:Mengaktifkan fitur Row Level Security pada semua tabel
ALTER TABLE ukurans ENABLE ROW LEVEL SECURITY;
ALTER TABLE bahans ENABLE ROW LEVEL SECURITY;
ALTER TABLE konversis ENABLE ROW LEVEL SECURITY;
ALTER TABLE reseps ENABLE ROW LEVEL SECURITY;
ALTER TABLE resep_bahans ENABLE ROW LEVEL SECURITY;

-- STREAMING_CHUNK:Membuat aturan akses CRUD untuk tabel ukurans
-- Penjelasan: FOR ALL (Izinkan Select, Insert, Update, Delete) 
-- TO authenticated (Hanya untuk user yang terotentikasi/Login)
CREATE POLICY "Akses penuh admin untuk ukurans"
ON ukurans FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- STREAMING_CHUNK:Membuat aturan akses CRUD untuk tabel bahans
CREATE POLICY "Akses penuh admin untuk bahans"
ON bahans FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- STREAMING_CHUNK:Membuat aturan akses CRUD untuk tabel konversis
CREATE POLICY "Akses penuh admin untuk konversis"
ON konversis FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- STREAMING_CHUNK:Membuat aturan akses CRUD untuk tabel reseps
CREATE POLICY "Akses penuh admin untuk reseps"
ON reseps FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- STREAMING_CHUNK:Membuat aturan akses CRUD untuk tabel pivot resep_bahans
CREATE POLICY "Akses penuh admin untuk resep_bahans"
ON resep_bahans FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);