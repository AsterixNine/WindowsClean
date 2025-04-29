# 🧹 Otimizador de Sistema - Windows Clean (Script .bat)

Este é um script avançado de limpeza e otimização para sistemas Windows.  
Ideal para quem deseja melhorar o desempenho geral do computador, liberar espaço em disco e otimizar a conexão de internet.

---

## 🚀 Funcionalidades

- 🗑️ Limpeza de arquivos temporários do sistema
- 🧹 Limpeza de cache de internet, logs, miniaturas e pastas como `Prefetch`
- 🧼 Limpeza de arquivos de atualizações e da lixeira
- 🌐 Otimização da conexão de rede:
  - Flush DNS
  - Renovação de IP
  - Reset de TCP/IP e Winsock
  - Ajuste do nível de autotuning TCP
- ⚙️ Desabilitação de serviços desnecessários:
  - Telemetria e rastreamento (DiagTrack)
  - Impressão (Spooler), Relatório de Erros e outros
- 🔧 Ajustes no registro para desligamento mais rápido
- ❌ Desativação de atualizações automáticas e apps em segundo plano

---

## 🛠️ Requisitos

- Sistema: **Windows 10 ou 11**
- Permissão: **Executar como Administrador**
- Tipo de disco: Funciona em **SSD e HDD** (não faz desfragmentação por padrão)

---

## 📦 Como usar

1. Baixe o script `WindowsClean.bat`
2. Clique com o botão direito e selecione **"Executar como administrador"**
3. Aguarde a execução das tarefas
4. Reinicie o computador para aplicar todas as otimizações

---

## ⚠️ Avisos

- Algumas funções desabilitam recursos que **podem ser importantes para alguns usuários** (como a busca rápida ou serviços de impressão).
- Use o script com responsabilidade. Testado em ambientes Windows padrão.
- Para restaurar algum serviço, use:
  ```bat
  sc config NOME_DO_SERVIÇO start=auto
