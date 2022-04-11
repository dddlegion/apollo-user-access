FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Apollo.UserAccess.API/Apollo.UserAccess.API.csproj", "Apollo.UserAccess.API/"]
RUN dotnet restore "Apollo.UserAccess.API/Apollo.UserAccess.API.csproj"
COPY . .
WORKDIR "/src/Apollo.UserAccess.API"
RUN dotnet build "Apollo.UserAccess.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Apollo.UserAccess.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Apollo.UserAccess.API.dll"]
