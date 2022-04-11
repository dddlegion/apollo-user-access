FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

COPY ["API/Apollo.UserAccess.API.csproj", "API/"]
COPY ["Domain/Apollo.UserAccess.Domain.csproj", "Domain/"]
COPY ["Tests/Unit/Apollo.UserAccess.Tests.Unit.csproj", "Tests/Unit/"]

RUN dotnet restore "API/Apollo.UserAccess.API.csproj"
COPY . .
WORKDIR "/src/API"
RUN dotnet build "Apollo.UserAccess.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Apollo.UserAccess.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

CMD ["dotnet", "Apollo.UserAccess.API.dll"]
