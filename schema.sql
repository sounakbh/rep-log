create table if not exists public.rep_log_records (
  owner uuid not null default auth.uid() references auth.users(id) on delete cascade,
  kind text not null check (kind in ('routine', 'workout')),
  id uuid not null,
  body jsonb not null check (jsonb_typeof(body) = 'object' and octet_length(body::text) <= 500000),
  revision integer not null default 1 check (revision > 0),
  primary key (owner, kind, id)
);
alter table public.rep_log_records enable row level security;
revoke all on public.rep_log_records from public, anon, authenticated;
grant select, insert, delete on public.rep_log_records to authenticated;
grant update (body, revision) on public.rep_log_records to authenticated;
drop policy if exists "Owners access their own entries" on public.rep_log_records;
create policy "Owners access their own entries" on public.rep_log_records
  for all to authenticated using ((select auth.uid()) = owner)
  with check ((select auth.uid()) = owner);
