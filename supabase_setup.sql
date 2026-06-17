-- ============================================================
-- FILHOS DA TRIBO — Setup do Banco de Dados (Supabase)
-- Execute este script no SQL Editor do seu projeto Supabase
-- ============================================================

-- TABELA: produtos
create table if not exists produtos (
  id         uuid primary key default gen_random_uuid(),
  nome       text not null,
  categoria  text default 'Cerâmica Pintada',
  descricao  text,
  imagens    text[] default '{}',
  destaque   boolean default false,
  criado_em  timestamptz default now()
);

-- TABELA: camisetas
create table if not exists camisetas (
  id        uuid primary key default gen_random_uuid(),
  nome      text not null,
  descricao text,
  imagem    text,
  criado_em timestamptz default now()
);

-- TABELA: config (uma única linha com id=1)
create table if not exists config (
  id        int primary key default 1,
  whatsapp  text default '',
  instagram text default 'filhosdatribo',
  email     text default '',
  endereco  text default 'Salvador, Bahia, Brasil'
);

-- Garante que só existe uma linha de config
insert into config (id) values (1) on conflict (id) do nothing;

-- ============================================================
-- PERMISSÕES (Row Level Security)
-- ============================================================

-- Habilita RLS nas tabelas
alter table produtos  enable row level security;
alter table camisetas enable row level security;
alter table config    enable row level security;

-- Qualquer pessoa pode LER (site público)
create policy "leitura_publica_produtos"  on produtos  for select using (true);
create policy "leitura_publica_camisetas" on camisetas for select using (true);
create policy "leitura_publica_config"    on config    for select using (true);

-- Apenas usuários autenticados podem ESCREVER (admin)
create policy "escrita_admin_produtos"  on produtos  for all using (auth.role() = 'authenticated');
create policy "escrita_admin_camisetas" on camisetas for all using (auth.role() = 'authenticated');
create policy "escrita_admin_config"    on config    for all using (auth.role() = 'authenticated');

-- ============================================================
-- STORAGE: bucket para imagens
-- ============================================================
insert into storage.buckets (id, name, public)
values ('imagens', 'imagens', true)
on conflict (id) do nothing;

-- Qualquer pessoa pode VER as imagens
create policy "imagens_publicas"
  on storage.objects for select
  using (bucket_id = 'imagens');

-- Apenas autenticados podem ENVIAR imagens
create policy "upload_admin"
  on storage.objects for insert
  with check (bucket_id = 'imagens' and auth.role() = 'authenticated');

-- Apenas autenticados podem DELETAR imagens
create policy "delete_admin"
  on storage.objects for delete
  using (bucket_id = 'imagens' and auth.role() = 'authenticated');
