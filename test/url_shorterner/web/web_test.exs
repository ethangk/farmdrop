defmodule UrlShorterner.WebTest do
  use UrlShorterner.DataCase

  alias UrlShorterner.Web

  describe "urls" do
    alias UrlShorterner.Web.Url

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def url_fixture(attrs \\ %{}) do
      {:ok, url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Web.create_url()

      url
    end

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert Web.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Web.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      assert {:ok, %Url{} = url} = Web.create_url(@valid_attrs)
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Web.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      assert {:ok, %Url{} = url} = Web.update_url(url, @update_attrs)
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Web.update_url(url, @invalid_attrs)
      assert url == Web.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %Url{}} = Web.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Web.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Web.change_url(url)
    end
  end
end
