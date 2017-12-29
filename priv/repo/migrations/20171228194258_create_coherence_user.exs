defmodule Target.Repo.Migrations.CreateCoherenceUser do
  use Ecto.Migration
  def change do
    create table(:users) do

      add :name, :string
      add :email, :string
      # authenticatable
      add :password_hash, :string
      # recoverable
      add :reset_password_token, :string
      add :reset_password_sent_at, :utc_datetime

      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
