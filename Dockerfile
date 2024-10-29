# Etapa de build
FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o fullcycle main.go

# Gerando imagem
FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
CMD ["/fullcycle"]
